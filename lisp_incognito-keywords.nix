
{ buildLispPackage, stdenv, fetchurl, lisp-project_incognito-keywords, 
   lisp_enhanced-eval-when, lisp_map-bind,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_enhanced-eval-when lisp_map-bind  ];
      inherit stdenv;
      systemName = "incognito-keywords";
      
      sourceProject = "${lisp-project_incognito-keywords}";
      patches = [];
      lisp_dependencies = "${lisp_enhanced-eval-when} ${lisp_map-bind}";
      name = "lisp_incognito-keywords-1.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
