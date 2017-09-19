
{ buildLispPackage, stdenv, fetchurl, lisp-project_osicat, 
   lisp_cffi-grovel, lisp_trivial-features,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-grovel lisp_trivial-features  ];
      inherit stdenv;
      systemName = "osicat";
      
      sourceProject = "${lisp-project_osicat}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-grovel} ${lisp_trivial-features}";
      name = "lisp_osicat-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
