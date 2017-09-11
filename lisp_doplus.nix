
{ buildLispPackage, stdenv, fetchurl, lisp-project_doplus, 
   lisp_parse-declarations-1-0,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-declarations-1-0  ];
      inherit stdenv;
      systemName = "doplus";
      
      sourceProject = "${lisp-project_doplus}";
      patches = [];
      lisp_dependencies = "${lisp_parse-declarations-1-0}";
      name = "lisp_doplus-20170630-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
