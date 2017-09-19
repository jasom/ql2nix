
{ buildLispPackage, stdenv, fetchurl, lisp-project_remote-js, 
   lisp_find-port, lisp_cl-markup, lisp_trivial-ws, lisp_clack,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_find-port lisp_cl-markup lisp_trivial-ws lisp_clack  ];
      inherit stdenv;
      systemName = "remote-js";
      
      sourceProject = "${lisp-project_remote-js}";
      patches = [];
      lisp_dependencies = "${lisp_find-port} ${lisp_cl-markup} ${lisp_trivial-ws} ${lisp_clack}";
      name = "lisp_remote-js-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
