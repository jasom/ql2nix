
{ buildLispPackage, stdenv, fetchurl, lisp-project_protobuf, 
   lisp_nibbles, lisp_com-google-base,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_nibbles lisp_com-google-base  ];
      inherit stdenv;
      systemName = "varint";
      
      sourceProject = "${lisp-project_protobuf}";
      patches = [];
      lisp_dependencies = "${lisp_nibbles} ${lisp_com-google-base}";
      name = "lisp_varint-20161208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
