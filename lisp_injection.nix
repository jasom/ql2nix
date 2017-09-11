
{ buildLispPackage, stdenv, fetchurl, lisp-project_injection, 
   lisp_cl-yaml,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-yaml  ];
      inherit stdenv;
      systemName = "injection";
      
      sourceProject = "${lisp-project_injection}";
      patches = [];
      lisp_dependencies = "${lisp_cl-yaml}";
      name = "lisp_injection-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
