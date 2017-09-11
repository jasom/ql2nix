
{ buildLispPackage, stdenv, fetchurl, lisp-project_ningle, 
   lisp_babel, lisp_clack-test, lisp_drakma, lisp_ningle, lisp_prove, lisp_yason,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_clack-test lisp_drakma lisp_ningle lisp_prove lisp_yason  ];
      inherit stdenv;
      systemName = "ningle-test";
      
      sourceProject = "${lisp-project_ningle}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_clack-test} ${lisp_drakma} ${lisp_ningle} ${lisp_prove} ${lisp_yason}";
      name = "lisp_ningle-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
