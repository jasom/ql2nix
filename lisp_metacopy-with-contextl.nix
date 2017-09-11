
{ buildLispPackage, stdenv, fetchurl, lisp-project_metacopy, 
   lisp_contextl, lisp_metacopy,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_contextl lisp_metacopy  ];
      inherit stdenv;
      systemName = "metacopy-with-contextl";
      
      sourceProject = "${lisp-project_metacopy}";
      patches = [];
      lisp_dependencies = "${lisp_contextl} ${lisp_metacopy}";
      name = "lisp_metacopy-with-contextl-20170403-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
