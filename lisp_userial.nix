
{ buildLispPackage, stdenv, fetchurl, lisp-project_userial, 
   lisp_contextl, lisp_ieee-floats, lisp_trivial-utf-8,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_contextl lisp_ieee-floats lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "userial";
      
      sourceProject = "${lisp-project_userial}";
      patches = [];
      lisp_dependencies = "${lisp_contextl} ${lisp_ieee-floats} ${lisp_trivial-utf-8}";
      name = "lisp_userial_0.8.2011.06.02";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
