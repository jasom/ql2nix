
{ buildLispPackage, stdenv, fetchurl, lisp-project_portableaserve, 
   lisp_acl-compat, lisp_htmlgen,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_acl-compat lisp_htmlgen  ];
      inherit stdenv;
      systemName = "aserve";
      
      sourceProject = "${lisp-project_portableaserve}";
      patches = [];
      lisp_dependencies = "${lisp_acl-compat} ${lisp_htmlgen}";
      name = "lisp_aserve-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
