
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi, 
   lisp_cffi-c2ffi, lisp_cl-ppcre, lisp_cl-json,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-c2ffi lisp_cl-ppcre lisp_cl-json  ];
      inherit stdenv;
      systemName = "cffi/c2ffi-generator";
      
      sourceProject = "${lisp-project_cffi}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-c2ffi} ${lisp_cl-ppcre} ${lisp_cl-json}";
      name = "lisp_cffi-c2ffi-generator_0.19.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
