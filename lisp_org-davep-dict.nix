
{ buildLispPackage, stdenv, fetchurl, lisp-project_org-davep-dict, 
   lisp_acl-compat, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_acl-compat lisp_split-sequence  ];
      inherit stdenv;
      systemName = "org-davep-dict";
      
      sourceProject = "${lisp-project_org-davep-dict}";
      patches = [];
      lisp_dependencies = "${lisp_acl-compat} ${lisp_split-sequence}";
      name = "lisp_org-davep-dict-20120407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
