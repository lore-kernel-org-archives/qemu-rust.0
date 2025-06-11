Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPHeq-000545-CZ
	for mharc-qemu-rust@gnu.org; Wed, 11 Jun 2025 05:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uPHep-00053p-D7; Wed, 11 Jun 2025 05:22:07 -0400
Received: from mgamail.intel.com ([198.175.65.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1uPHen-0000oX-1q; Wed, 11 Jun 2025 05:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749633725; x=1781169725;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ecj5LQgtLukfCv6Y/0WFmSiPVp7NqEZnSH87KcbmOYc=;
 b=Yminztq+WNrK0Dl16V3XNX76RdrZsKfpDh7KGQ5wfQ10pdaIn6SSOVTF
 SC8yAFYT2DxkVgOwN1wqJYfXxEXQGjvB+eTKdkBq4bVu3Krrev9vb/qll
 FnyrznxvdGLt7byVFUpZRdA1rfdK+czptW1R/H1LawTi/rtAo8gZzHybp
 jUZkgZU0ssV7HyBhH9zyP03Ux3SepTmf9YE9a5rCTPpb5RJFeMSaf3z/c
 Jgp5P5/M2MOaylZkoW17R93qq0F3AwQwXp04QAAJmCiQzqfBoC15OJ9dI
 1jdo15XGi1MY2Lkm8noerel4ZOTd+PZg+8ecoPvZaKBXvZFkweCGze7WG Q==;
X-CSE-ConnectionGUID: Js/Ij9SJSKeUwkHPNdrDzQ==
X-CSE-MsgGUID: WpFS/kVSRdOzPdrRIHjcwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51760307"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51760307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 02:22:00 -0700
X-CSE-ConnectionGUID: Vq4Mvd5kSFqGeh6UreQfcA==
X-CSE-MsgGUID: gaEBncx+Sqyeo6e012vlTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="151916641"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa003.jf.intel.com with ESMTP; 11 Jun 2025 02:21:58 -0700
Date: Wed, 11 Jun 2025 17:43:14 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: Re: [PATCH 2/5] rust: hpet: fully initialize object after
 instance_init
Message-ID: <aElPsiH4LlJyqF6F@intel.com>
References: <20250609154423.706056-1-pbonzini@redhat.com>
 <20250609154423.706056-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609154423.706056-3-pbonzini@redhat.com>
Received-SPF: pass client-ip=198.175.65.17; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jun 2025 09:22:07 -0000

On Mon, Jun 09, 2025 at 05:44:20PM +0200, Paolo Bonzini wrote:
> Date: Mon,  9 Jun 2025 17:44:20 +0200
> From: Paolo Bonzini <pbonzini@redhat.com>
> Subject: [PATCH 2/5] rust: hpet: fully initialize object after instance_init
> X-Mailer: git-send-email 2.49.0
> 
> The array of BqlRefCell<HPETTimer> is not initialized yet at the
> end of instance_init.  In particular, the "state" field is NonNull
> and therefore it is invalid to have it as zero bytes.
> 
> Note that MaybeUninit is necessary because assigning to self.timers[index]
> would trigger Drop of the old value.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/hw/timer/hpet/src/device.rs | 42 +++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 17 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


