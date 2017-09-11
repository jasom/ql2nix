
{ buildLispPackage, stdenv, fetchurl, lisp-project_json-responses, 
   lisp_cl-json, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "json-responses";
      
      sourceProject = "${lisp-project_json-responses}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_hunchentoot}";
      name = "lisp_json-responses-20151031-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
