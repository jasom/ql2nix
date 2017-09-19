
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl, 
   lisp_staple, lisp_closer-mop, lisp_rtg-math-vari, lisp_rtg-math, lisp_varjo, lisp_ieee-floats, lisp_fn, lisp_documentation-utils, lisp_cl-plus-c, lisp_cl-opengl, lisp_cl-fad, lisp_cl-autowrap, lisp_cffi,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_staple lisp_closer-mop lisp_rtg-math-vari lisp_rtg-math lisp_varjo lisp_ieee-floats lisp_fn lisp_documentation-utils lisp_cl-plus-c lisp_cl-opengl lisp_cl-fad lisp_cl-autowrap lisp_cffi  ];
      inherit stdenv;
      systemName = "cepl.documentation";
      
      sourceProject = "${lisp-project_cepl}";
      patches = [];
      lisp_dependencies = "${lisp_staple} ${lisp_closer-mop} ${lisp_rtg-math-vari} ${lisp_rtg-math} ${lisp_varjo} ${lisp_ieee-floats} ${lisp_fn} ${lisp_documentation-utils} ${lisp_cl-plus-c} ${lisp_cl-opengl} ${lisp_cl-fad} ${lisp_cl-autowrap} ${lisp_cffi}";
      name = "lisp_cepl-documentation-release-quicklisp-2a61dc0d-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
