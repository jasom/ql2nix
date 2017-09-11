
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-autowrap, 
  libffi,   lisp_cl-autowrap, lisp_cl-plus-c,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-autowrap lisp_cl-plus-c libffi ];
      inherit stdenv;
      systemName = "cl-autowrap/libffi";
      
      sourceProject = "${lisp-project_cl-autowrap}";
      patches = [];
      lisp_dependencies = "${lisp_cl-autowrap} ${lisp_cl-plus-c}";
      name = "lisp_cl-autowrap-libffi-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
