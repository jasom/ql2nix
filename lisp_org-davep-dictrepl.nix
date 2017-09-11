
{ buildLispPackage, stdenv, fetchurl, lisp-project_org-davep-dictrepl, 
   lisp_org-davep-dict,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_org-davep-dict  ];
      inherit stdenv;
      systemName = "org-davep-dictrepl";
      
      sourceProject = "${lisp-project_org-davep-dictrepl}";
      patches = [];
      lisp_dependencies = "${lisp_org-davep-dict}";
      name = "lisp_org-davep-dictrepl-20120407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
