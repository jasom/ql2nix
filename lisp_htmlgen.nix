
{ buildLispPackage, stdenv, fetchurl, lisp-project_portableaserve, 
   lisp_acl-compat,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_acl-compat  ];
      inherit stdenv;
      systemName = "htmlgen";
      
      sourceProject = "${lisp-project_portableaserve}";
      patches = [];
      lisp_dependencies = "${lisp_acl-compat}";
      name = "lisp_htmlgen-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
