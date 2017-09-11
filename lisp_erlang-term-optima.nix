
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-erlang-term, 
   lisp_erlang-term, lisp_optima,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_erlang-term lisp_optima  ];
      inherit stdenv;
      systemName = "erlang-term-optima";
      
      sourceProject = "${lisp-project_cl-erlang-term}";
      patches = [];
      lisp_dependencies = "${lisp_erlang-term} ${lisp_optima}";
      name = "lisp_erlang-term-optima-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
