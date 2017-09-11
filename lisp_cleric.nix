
{ buildLispPackage, stdenv, fetchurl, lisp-project_cleric, 
   lisp_alexandria, lisp_com-gigamonkeys-binary-data, lisp_epmd, lisp_erlang-term, lisp_md5, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_com-gigamonkeys-binary-data lisp_epmd lisp_erlang-term lisp_md5 lisp_usocket  ];
      inherit stdenv;
      systemName = "cleric";
      
      sourceProject = "${lisp-project_cleric}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_com-gigamonkeys-binary-data} ${lisp_epmd} ${lisp_erlang-term} ${lisp_md5} ${lisp_usocket}";
      name = "lisp_cleric-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
