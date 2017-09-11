
{ buildLispPackage, stdenv, fetchurl, lisp-project_postoffice, 
   lisp_acl-compat,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_acl-compat  ];
      inherit stdenv;
      systemName = "postoffice";
      
      sourceProject = "${lisp-project_postoffice}";
      patches = [];
      lisp_dependencies = "${lisp_acl-compat}";
      name = "lisp_postoffice-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
