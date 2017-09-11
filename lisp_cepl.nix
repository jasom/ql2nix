
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl, 
   lisp_bordeaux-threads, lisp_cffi, lisp_cl-autowrap, lisp_cl-fad, lisp_cl-opengl, lisp_cl-plus-c, lisp_cl-ppcre, lisp_closer-mop, lisp_documentation-utils, lisp_fn, lisp_ieee-floats, lisp_named-readtables, lisp_rtg-math, lisp_rtg-math-vari, lisp_varjo,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cffi lisp_cl-autowrap lisp_cl-fad lisp_cl-opengl lisp_cl-plus-c lisp_cl-ppcre lisp_closer-mop lisp_documentation-utils lisp_fn lisp_ieee-floats lisp_named-readtables lisp_rtg-math lisp_rtg-math-vari lisp_varjo  ];
      inherit stdenv;
      systemName = "cepl";
      
      sourceProject = "${lisp-project_cepl}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cffi} ${lisp_cl-autowrap} ${lisp_cl-fad} ${lisp_cl-opengl} ${lisp_cl-plus-c} ${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_documentation-utils} ${lisp_fn} ${lisp_ieee-floats} ${lisp_named-readtables} ${lisp_rtg-math} ${lisp_rtg-math-vari} ${lisp_varjo}";
      name = "lisp_cepl-release-quicklisp-d24231e2-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
