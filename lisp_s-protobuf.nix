
{ buildLispPackage, stdenv, fetchurl, lisp-project_s-protobuf, 
   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "s-protobuf";
      
      sourceProject = "${lisp-project_s-protobuf}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_s-protobuf-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
