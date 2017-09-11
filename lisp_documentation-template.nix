
{ buildLispPackage, stdenv, fetchurl, lisp-project_documentation-template, 
   lisp_cl-who,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-who  ];
      inherit stdenv;
      systemName = "documentation-template";
      
      sourceProject = "${lisp-project_documentation-template}";
      patches = [];
      lisp_dependencies = "${lisp_cl-who}";
      name = "lisp_documentation-template-0.4.4";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
