
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-finalizers, 
   lisp_asdf-finalizers,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-finalizers  ];
      inherit stdenv;
      systemName = "list-of";
      
      sourceProject = "${lisp-project_asdf-finalizers}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-finalizers}";
      name = "lisp_list-of-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
