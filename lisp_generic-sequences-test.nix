
{ buildLispPackage, stdenv, fetchurl, lisp-project_generic-sequences, 
   lisp_generic-sequences, lisp_generic-sequences-cont, lisp_generic-sequences-iterate, lisp_generic-sequences-stream, lisp_rt,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_generic-sequences lisp_generic-sequences-cont lisp_generic-sequences-iterate lisp_generic-sequences-stream lisp_rt  ];
      inherit stdenv;
      systemName = "generic-sequences-test";
      
      sourceProject = "${lisp-project_generic-sequences}";
      patches = [];
      lisp_dependencies = "${lisp_generic-sequences} ${lisp_generic-sequences-cont} ${lisp_generic-sequences-iterate} ${lisp_generic-sequences-stream} ${lisp_rt}";
      name = "lisp_generic-sequences-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
