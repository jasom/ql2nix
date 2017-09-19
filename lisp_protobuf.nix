
{ buildLispPackage, stdenv, fetchurl, lisp-project_protobuf, 
   lisp_trivial-utf-8, lisp_nibbles, lisp_com-google-base,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-utf-8 lisp_nibbles lisp_com-google-base  ];
      inherit stdenv;
      systemName = "protobuf";
      
      sourceProject = "${lisp-project_protobuf}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-utf-8} ${lisp_nibbles} ${lisp_com-google-base}";
      name = "lisp_protobuf-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
