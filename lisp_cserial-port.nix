
{ buildLispPackage, stdenv, fetchurl, lisp-project_cserial-port, 
   lisp_osicat, lisp_trivial-gray-streams, lisp_cffi-grovel, lisp_trivial-features,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_osicat lisp_trivial-gray-streams lisp_cffi-grovel lisp_trivial-features  ];
      inherit stdenv;
      systemName = "cserial-port";
      
      sourceProject = "${lisp-project_cserial-port}";
      patches = [];
      lisp_dependencies = "${lisp_osicat} ${lisp_trivial-gray-streams} ${lisp_cffi-grovel} ${lisp_trivial-features}";
      name = "lisp_cserial-port-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
