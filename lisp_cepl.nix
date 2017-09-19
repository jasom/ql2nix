
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl, 
   lisp_closer-mop, lisp_rtg-math-vari, lisp_rtg-math, lisp_varjo, lisp_ieee-floats, lisp_fn, lisp_documentation-utils, lisp_cl-plus-c, lisp_cl-opengl, lisp_cl-fad, lisp_cl-autowrap, lisp_cffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_rtg-math-vari lisp_rtg-math lisp_varjo lisp_ieee-floats lisp_fn lisp_documentation-utils lisp_cl-plus-c lisp_cl-opengl lisp_cl-fad lisp_cl-autowrap lisp_cffi  ];
      inherit stdenv;
      systemName = "cepl";
      
      sourceProject = "${lisp-project_cepl}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_rtg-math-vari} ${lisp_rtg-math} ${lisp_varjo} ${lisp_ieee-floats} ${lisp_fn} ${lisp_documentation-utils} ${lisp_cl-plus-c} ${lisp_cl-opengl} ${lisp_cl-fad} ${lisp_cl-autowrap} ${lisp_cffi}";
      name = "lisp_cepl-release-quicklisp-2a61dc0d-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
