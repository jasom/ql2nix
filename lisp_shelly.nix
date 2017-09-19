
{ buildLispPackage, stdenv, fetchurl, lisp-project_shelly, 
   lisp_trivial-signal, lisp_local-time, lisp_cl-fad, lisp_split-sequence,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-signal lisp_local-time lisp_cl-fad lisp_split-sequence  ];
      inherit stdenv;
      systemName = "shelly";
      
      sourceProject = "${lisp-project_shelly}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-signal} ${lisp_local-time} ${lisp_cl-fad} ${lisp_split-sequence}";
      name = "lisp_shelly-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
