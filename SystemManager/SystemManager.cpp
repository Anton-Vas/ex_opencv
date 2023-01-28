
#include <SystemManager.hpp>




SystemManager::SystemManager                    (){
    /*~~~~~~~~~~~~~~~ ADD ~~~~~~~~~~~~~~~*/
}

SystemManager::~SystemManager                   (){
    delete  sys_param, debug;
    tracker_mil.release();
    tracker_kcf.release();
    tracker_csrt.release();
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
///     main interface                                                                                ///
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void SystemManager::system_loop                 (){
    ///> SETUP .........................................................................................
    if (vid_capture.open(vid_port)) { 
        debug->print_debug(debug->DONE, debug->SYS_VIDEO_CAP_OK, vid_port);
    }
    else {
        debug->print_debug(debug->ERROR, debug->SYS_VIDEO_CAP_ERR, vid_port);
    }

    while(!vid_capture.isOpened()){}

    //> set resolution
    vid_capture.set(CAP_PROP_FRAME_HEIGHT, c_org_h);
    vid_capture.set(CAP_PROP_FRAME_WIDTH,  c_org_w);
    vid_capture.set(CAP_PROP_FOURCC,       VideoWriter::fourcc('M', 'J', 'P', 'G'));
    vid_capture.set(CAP_PROP_FPS,          30);

    setup_video_GUI();

    debug->print_sys_capture_info(&vid_capture);
    // debug->print_sys_opencv_info();



    ///> LOOP START ....................................................................................
    debug->print_debug(debug->INFO, debug->SYS_VIDEO_LOOP);
    debug->print_debug_cmd_options();

    while( getWindowProperty(gui->c_org_wind_name, 0) >= 0 || sys_param->f_video_run == false){

        //> system
        timer_fps = static_cast<double>(getTickCount());

        vid_capture.read(org_frame);
        if(org_frame.empty()){
            debug->print_debug(debug->ERROR, debug->SYS_ORG_FRAME_EMPTY);
            continue;
        }
        
        fps = getTickFrequency() / ((double)getTickCount() - timer_fps);

        //> video options
        enable_video_GUI();

        //> waiting & getting command
        get_cmd(waitKey(1));
    }
    ///> LOOP END ......................................................................................
    debug->print_debug(debug->INFO, debug->SYS_GUI_CLOSE);



    destroy_all_windows();

}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
///     ENABLE...                                                                                     ///
/////////////////////////////////////////////////////////////////////////////////////////////////////////



void SystemManager::enable_video_GUI            (){
    if (sys_param->f_supres) {//> supres

        enable_supres();

        gui->show_video_FPS(out_supres_frame, fps);
        imshow( gui->c_fsrcnn_wind_name, out_supres_frame);
    }
    else if (sys_param->f_supres_wind_close){
        destroy_window(gui->c_fsrcnn_wind_name);
        sys_param->f_supres_wind_close = false;
    }

    if (sys_param->f_track)         {//> track

        org_frame.copyTo(out_track_frame);

        enable_track();
        
        gui->show_video_FPS(out_track_frame, fps);
        imshow( gui->c_track_wind_name, out_track_frame);
    }
    else if (sys_param->f_track_wind_close){
        destroy_window(gui->c_track_wind_name);
        sys_param->f_track_wind_close = false;
    }

    if (sys_param->f_shrec)         {//> shrec

        enable_shrec();

        gui->show_video_FPS(out_shrec_frame, fps);
        imshow( gui->c_shrec_wind_name, out_shrec_frame);
    }
    else if (sys_param->f_shrec_wind_close){
        destroy_window(gui->c_shrec_wind_name);
        sys_param->f_shrec_wind_close = false;
    }

    if (sys_param->f_hrec)          {//> hrec

        org_frame.copyTo(out_hrec_frame);
        enable_hrec();

        gui->show_video_FPS(out_hrec_frame, fps);
        imshow( gui->c_hrec_wind_name, out_hrec_frame);
    }
    else if (sys_param->f_hrec_wind_close){
        destroy_window(gui->c_hrec_wind_name);
        sys_param->f_hrec_wind_close = false;
    }

    //> original
    gui->show_video_FPS(org_frame, fps);
    imshow( gui->c_org_wind_name, org_frame);
}

void SystemManager::enable_supres               (){
    //> init
    if (sys_param->f_supres_init){
        setup_supres();
    }

    //> run
    if (sys_param->f_supres_enable){
        sr.upsample( org_frame, out_supres_frame);
    }
}

void SystemManager::enable_track                (){
    //> init
    if (sys_param->f_track_init){
        setup_track();
    }

    //> run
    if (sys_param->f_track_enable){
        //> update all trackers
        f_track_mil_status = tracker_mil->update(out_track_frame, roi_mil_rect);
        f_track_kcf_status = tracker_kcf->update(out_track_frame, roi_kcf_rect);
        f_track_csrt_status = tracker_csrt->update(out_track_frame, roi_csrt_rect);

        //> add visualisation
        //> MIL
        if(f_track_mil_status){
            rectangle( out_track_frame, roi_mil_rect, gui->c_clr_TR_MIL, 2, 1);
            putText( out_track_frame, "MIL", {roi_mil_rect.x, roi_mil_rect.y}, FONT_HERSHEY_SIMPLEX, 1, gui->c_clr_TR_MIL, 2);
            gui->show_video_TRACK_STAT(out_track_frame, gui->track_type::MIL, gui->track_stat::OK);
        }
        else{
            gui->show_video_TRACK_STAT(out_track_frame, gui->track_type::MIL, gui->track_stat::LOST);
        }

        //> KCF
        if(f_track_kcf_status){
            rectangle( out_track_frame, roi_kcf_rect, gui->c_clr_TR_KCF, 2, 1 );
            putText( out_track_frame, "KCF", {roi_kcf_rect.x, roi_kcf_rect.y}, FONT_HERSHEY_SIMPLEX, 1, gui->c_clr_TR_KCF, 2);
            gui->show_video_TRACK_STAT(out_track_frame, gui->track_type::KCF, gui->track_stat::OK);
        }
        else{
            gui->show_video_TRACK_STAT(out_track_frame, gui->track_type::KCF, gui->track_stat::LOST);
        }

        //> CSRT
        if(f_track_csrt_status){
            rectangle( out_track_frame, roi_csrt_rect, gui->c_clr_TR_CSRT, 2, 1 );
            putText( out_track_frame, "CSRT", {roi_csrt_rect.x, roi_csrt_rect.y}, FONT_HERSHEY_SIMPLEX, 1, gui->c_clr_TR_CSRT, 2 );
            gui->show_video_TRACK_STAT(out_track_frame, gui->track_type::CSRT, gui->track_stat::OK);
        }
        else{
            gui->show_video_TRACK_STAT(out_track_frame, gui->track_type::CSRT, gui->track_stat::LOST);
        }
    }
}

void SystemManager::enable_shrec                (){
    //> init
    if (sys_param->f_shrec_init){
        setup_shrec();
    }

    //> run
    if (sys_param->f_shrec_enable){

        org_frame.copyTo(tmp_shrec_frame);

        //> convert to grayscale
        cvtColor(org_frame, gray_shrec_frame, COLOR_BGR2GRAY);

        //> get every visible edge
        blur( gray_shrec_frame, edges_shrec_frame, Size(3,3) );
        Canny(gray_shrec_frame, edges_shrec_frame, c_canny_threshold1, c_canny_threshold2, c_canny_apertureSize, c_canny_L2gradient);

        //> search for contours
        findContours(edges_shrec_frame, shrec_contours, c_find_cntr_mode, c_find_cntr_method);

        //> beginning of shape search
        for(int i = 0 ; i < shrec_contours.size(); i++){

            //> approximate contour with accuracy proportional to the contour perimeter
		    approxPolyDP(
                Mat(shrec_contours[i]),
                shrec_approx, 
                arcLength(
                    Mat(shrec_contours[i]),
                    true
                )*0.02,
                true
            );

		    //> skip small or non-convex objects 
		    if (fabs(contourArea(shrec_contours[i])) < 100 || !isContourConvex(shrec_approx)) {
                continue;
            }

            if (shrec_approx.size() == 3){//> triangles
                set_shrec_label(tmp_shrec_frame, "TRI", shrec_contours[i]);
            }
            else if (shrec_approx.size() >= 4 && shrec_approx.size() <= 6){ //> rectangles and more
                
                //> number of vertices of polygonal curve
                shrec_vtc = shrec_approx.size();

                //> get the cosines of all corners
                vector<double> cos;
                for (int j = 2; j < shrec_vtc+1; j++){
                    cos.push_back(
                        get_cosine_angle(
                            shrec_approx[j%shrec_vtc],
                            shrec_approx[j-2],
                            shrec_approx[j-1]
                        )
                    );
                }

                //> sort ascending the cosine values
                sort(cos.begin(), cos.end());

                //> get the lowest and the highest cosine
                shrec_mincos = cos.front();
                shrec_maxcos = cos.back();

                //> use the degrees obtained above and the number of vertices to determine the shape of the contour
                if      (shrec_vtc == 4 && shrec_mincos >= -0.1 && shrec_maxcos <= 0.3)     { //> rectangle
                    set_shrec_label(tmp_shrec_frame, "RECT", shrec_contours[i]);
                }
                else if (shrec_vtc == 5 && shrec_mincos >= -0.34 && shrec_maxcos <= -0.27)  { //> pentagon
                    set_shrec_label(tmp_shrec_frame, "PENTA", shrec_contours[i]);
                }
                else if (shrec_vtc == 6 && shrec_mincos >= -0.55 && shrec_maxcos <= -0.45)  { //> hexagon
                    set_shrec_label(tmp_shrec_frame, "HEXA", shrec_contours[i]);
                }
            }
            else{ //> circles
                //> detect and label circles
                shrec_circle_area = contourArea(shrec_contours[i]);
                shrec_circle_rect = boundingRect(shrec_contours[i]);
                shrec_circle_radius = shrec_circle_rect.width / 2;

                if (abs(1 - ((double)shrec_circle_rect.width / shrec_circle_rect.height)) <= 0.2 &&
                    abs(1 - (shrec_circle_area / (CV_PI * pow(shrec_circle_radius, 2)))) <= 0.2)
                    set_shrec_label(tmp_shrec_frame, "CIR", shrec_contours[i]);
            }
        }

        //> convert 'edges_shrec_frame' from 1 channel into 3
        cvtColor(edges_shrec_frame, edges_tmp_shrec_frame, COLOR_GRAY2BGR);
        
        vconcat(edges_tmp_shrec_frame, tmp_shrec_frame, out_shrec_frame);

        //> debug frames
        // debug->print_frame_type_info(edges_tmp_shrec_frame, GET_VAR_NAME_TO_CHAR(edges_tmp_shrec_frame));
        // debug->print_frame_type_info(tmp_shrec_frame, GET_VAR_NAME_TO_CHAR(tmp_shrec_frame));
        // debug->print_frame_type_info(out_shrec_frame, GET_VAR_NAME_TO_CHAR(out_shrec_frame));
    }
}

void SystemManager::enable_hrec                 (){
    //> init
    if (sys_param->f_hrec_init){
        setup_hrec();
    }

    //> run
    if (sys_param->f_hrec_enable){
        //..
    }

}




/////////////////////////////////////////////////////////////////////////////////////////////////////////
///     SETUP...                                                                                      ///
/////////////////////////////////////////////////////////////////////////////////////////////////////////


void SystemManager::setup_video_GUI             (){
    debug->print_debug(debug->INFO, debug->SYS_GUI_SETUP);

    //> original video
    create_window(gui->c_org_wind_name, gui->c_vid_wind_flag);
}

void SystemManager::setup_supres                (){
    create_window(gui->c_fsrcnn_wind_name, gui->c_vid_wind_flag);
    
    sr.readModel(fsrcnn_model_path);
    sr.setModel(fsrcnn_model_name, fsrcnn_scale);

    sys_param->f_supres_init        = false;
    sys_param->f_supres_enable      = true;
    sys_param->f_supres_wind_close  = true;

    debug->print_debug(debug->DONE, debug->SYS_SUPRES_OK);
}

void SystemManager::setup_track                 (){
    create_window(gui->c_track_wind_name, gui->c_vid_wind_flag);

    tracker_mil = TrackerMIL::create();
    tracker_mil->init(out_track_frame, roi_mil_rect);

    tracker_kcf = TrackerKCF::create();
    tracker_kcf->init(out_track_frame, roi_kcf_rect);

    tracker_csrt = TrackerCSRT::create();
    tracker_csrt->init(out_track_frame, roi_csrt_rect);

    sys_param->f_track_init         = false;
    sys_param->f_track_enable       = true;
    sys_param->f_track_wind_close   = true;

    debug->print_debug(debug->DONE, debug->SYS_TRACK_OK);
}

void SystemManager::setup_shrec                 (){
    create_window(gui->c_shrec_wind_name, gui->c_vid_wind_flag);

    sys_param->f_shrec_init         = false;
    sys_param->f_shrec_enable       = true;
    sys_param->f_shrec_wind_close   = true;

    debug->print_debug(debug->DONE, debug->SYS_SHREC_OK);
}

void SystemManager::setup_hrec                  (){
    create_window(gui->c_hrec_wind_name, gui->c_vid_wind_flag);

    sys_param->f_hrec_init          = false;
    sys_param->f_hrec_enable        = true;
    sys_param->f_hrec_wind_close    = true;

    debug->print_debug(debug->DONE, debug->SYS_HREC_OK);
}





/////////////////////////////////////////////////////////////////////////////////////////////////////////
///     OTHER...                                                                                      ///
/////////////////////////////////////////////////////////////////////////////////////////////////////////


void SystemManager::get_cmd                     (const char _cmd){
    if(_cmd != -1){
        if      (_cmd == 'c'){//> clear all
            clear_all_flags();
            debug->print_debug(debug->INFO, debug->SYS_NEW_CMD, "close all except original video stream");
        }
        else if (_cmd == 'd'){//> debug
            debug->print_debug(debug->INFO, debug->SYS_NEW_CMD, "output all control options");
            debug->print_debug_cmd_options();
        }
        else if (_cmd == 's'){//> supres
            clear_all_flags();
            sys_param->f_supres = !sys_param->f_supres;
            sys_param->f_supres_init   = !sys_param->f_supres_init;
            debug->print_debug(debug->INFO, debug->SYS_NEW_CMD, "super resolution is activated");
        }
        else if (_cmd == 't'){//> track
            clear_all_flags();
            sys_param->f_track         = !sys_param->f_track;
            sys_param->f_track_init    = !sys_param->f_track_init;
            debug->print_debug(debug->INFO, debug->SYS_NEW_CMD, "single object tracking is activated");
        }
        else if (_cmd == 'o'){//> shrec
            clear_all_flags();
            sys_param->f_shrec         = !sys_param->f_shrec;
            sys_param->f_shrec_init    = !sys_param->f_shrec_init;
            debug->print_debug(debug->INFO, debug->SYS_NEW_CMD, "shape recognition is activated");
        }
        else if (_cmd == 'h'){//> hrec
            clear_all_flags();
            sys_param->f_hrec          = !sys_param->f_hrec;
            sys_param->f_hrec_init     = !sys_param->f_hrec_init;
            debug->print_debug(debug->INFO, debug->SYS_NEW_CMD, "hand recognition is activated");
        }
    }
}

void SystemManager::clear_all_flags             (){
    sys_param->f_supres            = false;
    sys_param->f_supres_init       = false;
    sys_param->f_supres_enable     = false;
     sys_param->f_track            = false;
     sys_param->f_track_init       = false;
     sys_param->f_track_enable     = false;
    sys_param->f_shrec             = false;
    sys_param->f_shrec_init        = false;
    sys_param->f_shrec_enable      = false;
     sys_param->f_hrec             = false;
     sys_param->f_hrec_init        = false;
     sys_param->f_hrec_enable      = false;
}




double  SystemManager::get_cosine_angle         (const Point _pt1, const Point _pt2, const Point _pt0){
	double dx1 = _pt1.x - _pt0.x;
	double dy1 = _pt1.y - _pt0.y;
	double dx2 = _pt2.x - _pt0.x;
	double dy2 = _pt2.y - _pt0.y;
	return (dx1*dx2 + dy1*dy2)/sqrt((dx1*dx1 + dy1*dy1)*(dx2*dx2 + dy2*dy2) + 1e-10);
}

void  SystemManager::set_shrec_label            (const Mat& _im, const string _label, vector<Point>& _contour){
	int fontface = FONT_HERSHEY_SIMPLEX;
	double scale = 1;//0.4;
	int thickness = 1;
	int baseline = 0;

	Size text = getTextSize(_label, fontface, scale, thickness, &baseline);
	Rect r = boundingRect(_contour);

	Point pt(r.x + ((r.width - text.width) / 2), r.y + ((r.height + text.height) / 2));
	rectangle(
        _im,
        pt + Point(0, baseline),
        pt + Point(text.width, -text.height),
        CV_RGB(255,255,255),
        FILLED
    );
	putText(
        _im,
        _label,
        pt,
        fontface,
        scale,
        gui->c_clr_RED,
        thickness,
        8);
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
///     WINDOW ACTION                                                                                 ///
/////////////////////////////////////////////////////////////////////////////////////////////////////////

void SystemManager::destroy_all_windows         (){
    destroyAllWindows();
    debug->print_debug(debug->DONE, debug->SYS_WIND_CLOSE, "ALL");
}

void SystemManager::create_window               (const string& _win_name, const int _win_flag){
    namedWindow(_win_name, _win_flag);
    debug->print_debug(debug->DONE, debug->SYS_WIND_OPEN, _win_name);
}

void SystemManager::destroy_window              (const string& _win_name){
    destroyWindow(_win_name);
    debug->print_debug(debug->DONE, debug->SYS_WIND_CLOSE, _win_name);
}

void SystemManager::resize_window               (const string& _win_name, const int _w, const int _h){
    resizeWindow(_win_name, _w, _h);
}


