
{ buildLispPackage, stdenv, fetchurl, lisp-project_adw-charting, 
   lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "adw-charting";
      
      sourceProject = "${lisp-project_adw-charting}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_adw-charting-20120909-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
