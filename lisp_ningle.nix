
{ buildLispPackage, stdenv, fetchurl, lisp-project_ningle, 
   lisp_lack-response, lisp_lack-request, lisp_lack-component, lisp_myway,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lack-response lisp_lack-request lisp_lack-component lisp_myway  ];
      inherit stdenv;
      systemName = "ningle";
      
      sourceProject = "${lisp-project_ningle}";
      patches = [];
      lisp_dependencies = "${lisp_lack-response} ${lisp_lack-request} ${lisp_lack-component} ${lisp_myway}";
      name = "lisp_ningle-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
