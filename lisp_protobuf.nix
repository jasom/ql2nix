
{ buildLispPackage, stdenv, fetchurl, lisp-project_protobuf, 
   lisp_com-google-base, lisp_varint, lisp_trivial-utf-8,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-google-base lisp_varint lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "protobuf";
      
      sourceProject = "${lisp-project_protobuf}";
      patches = [];
      lisp_dependencies = "${lisp_com-google-base} ${lisp_varint} ${lisp_trivial-utf-8}";
      name = "lisp_protobuf-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
