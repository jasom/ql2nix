
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-soil, 
   lisp_staple, lisp_cl-opengl, lisp_documentation-utils, lisp_cffi,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_staple lisp_cl-opengl lisp_documentation-utils lisp_cffi  ];
      inherit stdenv;
      systemName = "cl-soil.documentation";
      
      sourceProject = "${lisp-project_cl-soil}";
      patches = [];
      lisp_dependencies = "${lisp_staple} ${lisp_cl-opengl} ${lisp_documentation-utils} ${lisp_cffi}";
      name = "lisp_cl-soil-documentation-release-quicklisp-69e1213c-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
