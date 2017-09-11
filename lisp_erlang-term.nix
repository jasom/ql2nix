
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-erlang-term, 
   lisp_alexandria, lisp_ieee-floats, lisp_nibbles, lisp_zlib,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_ieee-floats lisp_nibbles lisp_zlib  ];
      inherit stdenv;
      systemName = "erlang-term";
      
      sourceProject = "${lisp-project_cl-erlang-term}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_ieee-floats} ${lisp_nibbles} ${lisp_zlib}";
      name = "lisp_erlang-term-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
