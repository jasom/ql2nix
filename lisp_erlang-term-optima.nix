
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-erlang-term, 
   lisp_optima, lisp_zlib, lisp_nibbles, lisp_ieee-floats, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_optima lisp_zlib lisp_nibbles lisp_ieee-floats lisp_alexandria  ];
      inherit stdenv;
      systemName = "erlang-term-optima";
      
      sourceProject = "${lisp-project_cl-erlang-term}";
      patches = [];
      lisp_dependencies = "${lisp_optima} ${lisp_zlib} ${lisp_nibbles} ${lisp_ieee-floats} ${lisp_alexandria}";
      name = "lisp_erlang-term-optima-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
