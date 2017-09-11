
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-prevalence, 
   lisp_s-sysdeps, lisp_s-xml,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-sysdeps lisp_s-xml  ];
      inherit stdenv;
      systemName = "cl-prevalence";
      
      sourceProject = "${lisp-project_cl-prevalence}";
      patches = [];
      lisp_dependencies = "${lisp_s-sysdeps} ${lisp_s-xml}";
      name = "lisp_cl-prevalence-20130720-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
