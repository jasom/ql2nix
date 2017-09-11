
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-erlang-term, 
   lisp_erlang-term, lisp_erlang-term-optima, lisp_fiveam, lisp_nibbles,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_erlang-term lisp_erlang-term-optima lisp_fiveam lisp_nibbles  ];
      inherit stdenv;
      systemName = "erlang-term-test";
      
      sourceProject = "${lisp-project_cl-erlang-term}";
      patches = [];
      lisp_dependencies = "${lisp_erlang-term} ${lisp_erlang-term-optima} ${lisp_fiveam} ${lisp_nibbles}";
      name = "lisp_erlang-term-test-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
