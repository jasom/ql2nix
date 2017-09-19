
{ buildLispPackage, stdenv, fetchurl, lisp-project_form-fiddle, 
   lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "form-fiddle";
      
      sourceProject = "${lisp-project_form-fiddle}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils}";
      name = "lisp_form-fiddle-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
