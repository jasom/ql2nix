
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-webkit, 
   lisp_cffi, lisp_cl-cffi-gtk, lisp_cl-soup, lisp_cl-webkit-dom,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi lisp_cl-cffi-gtk lisp_cl-soup lisp_cl-webkit-dom  ];
      inherit stdenv;
      systemName = "cl-webkit2";
      
      sourceProject = "${lisp-project_cl-webkit}";
      patches = [];
      lisp_dependencies = "${lisp_cffi} ${lisp_cl-cffi-gtk} ${lisp_cl-soup} ${lisp_cl-webkit-dom}";
      name = "lisp_cl-webkit2-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
