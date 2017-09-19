
{ buildLispPackage, stdenv, fetchurl, lisp-project_adw-charting, 
   lisp_iterate, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_drakma  ];
      inherit stdenv;
      systemName = "adw-charting-google";
      
      sourceProject = "${lisp-project_adw-charting}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_drakma}";
      name = "lisp_adw-charting-google-20120909-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
