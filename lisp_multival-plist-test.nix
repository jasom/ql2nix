
{ buildLispPackage, stdenv, fetchurl, lisp-project_multival-plist, 
   lisp_cl-test-more, lisp_multival-plist,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-test-more lisp_multival-plist  ];
      inherit stdenv;
      systemName = "multival-plist-test";
      
      sourceProject = "${lisp-project_multival-plist}";
      patches = [];
      lisp_dependencies = "${lisp_cl-test-more} ${lisp_multival-plist}";
      name = "lisp_multival-plist-test-20120305-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
