
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mtgnet, 
   lisp_blackbird, lisp_cl-json, lisp_cl-netstring-, lisp_trivial-utf-8,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_blackbird lisp_cl-json lisp_cl-netstring- lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "cl-mtgnet";
      
      sourceProject = "${lisp-project_cl-mtgnet}";
      patches = [];
      lisp_dependencies = "${lisp_blackbird} ${lisp_cl-json} ${lisp_cl-netstring-} ${lisp_trivial-utf-8}";
      name = "lisp_cl-mtgnet-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
