
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-webkit, 
  gnome2, gnome3,   lisp_cl-cffi-gtk, lisp_cffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-cffi-gtk lisp_cffi gnome2.libsoup gnome3.webkitgtk ];
      inherit stdenv;
      systemName = "cl-webkit2";
      
      sourceProject = "${lisp-project_cl-webkit}";
      patches = [];
      lisp_dependencies = "${lisp_cl-cffi-gtk} ${lisp_cffi}";
      name = "lisp_cl-webkit2-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
