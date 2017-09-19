
{ buildLispPackage, stdenv, fetchurl, lisp-project_parachute, 
   lisp_cl-ppcre, lisp_form-fiddle, lisp_documentation-utils,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_form-fiddle lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "parachute-prove";
      
      sourceProject = "${lisp-project_parachute}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_form-fiddle} ${lisp_documentation-utils}";
      name = "lisp_parachute-prove-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
