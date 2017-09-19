
{ buildLispPackage, stdenv, fetchurl, lisp-project_snappy, 
   lisp_varint, lisp_nibbles, lisp_com-google-base,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_varint lisp_nibbles lisp_com-google-base  ];
      inherit stdenv;
      systemName = "snappy";
      
      sourceProject = "${lisp-project_snappy}";
      patches = [];
      lisp_dependencies = "${lisp_varint} ${lisp_nibbles} ${lisp_com-google-base}";
      name = "lisp_snappy-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
