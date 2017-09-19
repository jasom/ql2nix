
{ buildLispPackage, stdenv, fetchurl, lisp-project_parachute, 
   lisp_form-fiddle, lisp_documentation-utils,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_form-fiddle lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "parachute-fiveam";
      
      sourceProject = "${lisp-project_parachute}";
      patches = [];
      lisp_dependencies = "${lisp_form-fiddle} ${lisp_documentation-utils}";
      name = "lisp_parachute-fiveam-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
