
{ buildLispPackage, stdenv, fetchurl, lisp-project_parachute, 
   lisp_documentation-utils, lisp_form-fiddle,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_documentation-utils lisp_form-fiddle  ];
      inherit stdenv;
      systemName = "parachute";
      
      sourceProject = "${lisp-project_parachute}";
      patches = [];
      lisp_dependencies = "${lisp_documentation-utils} ${lisp_form-fiddle}";
      name = "lisp_parachute-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
