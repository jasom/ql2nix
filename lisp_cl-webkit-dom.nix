
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-webkit, 
  gnome3,   lisp_cffi, lisp_cl-cffi-gtk,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-cffi-gtk gnome3.webkitgtk ];
      inherit stdenv;
      systemName = "cl-webkit-dom";
      
      sourceProject = "${lisp-project_cl-webkit}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-cffi-gtk}";
      name = "lisp_cl-webkit-dom-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
