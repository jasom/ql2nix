
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-twitter, 
   lisp_cl-twitter, lisp_cl-mongo,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-twitter lisp_cl-mongo  ];
      inherit stdenv;
      systemName = "twitter-mongodb-driver";
      
      sourceProject = "${lisp-project_cl-twitter}";
      patches = [];
      lisp_dependencies = "${lisp_cl-twitter} ${lisp_cl-mongo}";
      name = "lisp_twitter-mongodb-driver-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
