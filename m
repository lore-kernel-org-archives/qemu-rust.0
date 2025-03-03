Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tp6Tb-0007y6-2w
	for mharc-qemu-rust@gnu.org; Mon, 03 Mar 2025 09:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1tp6T3-0007v8-Oj; Mon, 03 Mar 2025 09:08:27 -0500
Received: from mgamail.intel.com ([198.175.65.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1tp6T0-0005ow-64; Mon, 03 Mar 2025 09:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741010902; x=1772546902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cYg9gQJivnvnrJ5GVOpdMXeSeKglr3leGd4UVFX0/mQ=;
 b=L2pxpmssqVZIKU+aQs8/zOEg43MYy6Kv81XxlA/LLFiWuBgKC3A37wbz
 7/He/jgZDbItzgaZcnw65j7TN3H4Q5Rn1Tx9oAaTniaXJQHaegUPHvBq6
 IXw76l4PwZpA37CP/sXA9LTiw9eeGntcaoVqm1lLynL76Y5gF4XrWByfZ
 sME4wI4ez9ZCwn2f4h/oVyErb1Gb999vZJOslWYbcoaUVOGk2vkTO6IlO
 fq2LCsU2ZMtLIZ3osAPmhDgvf1NLg2/g6lDVJxslgjP8GDLn3IbARIEbk
 egxyeGqO2dMVvXEFNocYKEsGZdhppiPXpOsVQJciLf3Bnyn/Kz/QIicw5 A==;
X-CSE-ConnectionGUID: OoM5o7hPSLmDXpr83t/bgg==
X-CSE-MsgGUID: fc/+qCM7QmaT+IhtIvejAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53279050"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="53279050"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 06:08:17 -0800
X-CSE-ConnectionGUID: 46kBIb++S+Op3qO5hdy/eA==
X-CSE-MsgGUID: l/3MIYIVRQeZHTYcmXUkjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155203497"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa001.jf.intel.com with ESMTP; 03 Mar 2025 06:08:16 -0800
Date: Mon, 3 Mar 2025 22:28:23 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: Re: [PATCH 04/12] rust: timer: wrap QEMUTimer with Opaque<> and
 express pinning requirements
Message-ID: <Z8W8hzFO9HU3IujQ@intel.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
 <20250227142219.812270-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227142219.812270-5-pbonzini@redhat.com>
Received-SPF: pass client-ip=198.175.65.12; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 03 Mar 2025 14:08:46 -0000

> -    pub fn init_full<'timer, 'opaque: 'timer, T, F>(
> -        &'timer mut self,
> +    pub fn new_full<'opaque, T, F>(
>          timer_list_group: Option<&TimerListGroup>,
>          clk_type: ClockType,
>          scale: u32,
>          attributes: u32,
>          _cb: F,
>          opaque: &'opaque T,
> -    ) where
> +    ) -> Pin<Box<Self>>
>          F: for<'a> FnCall<(&'a T,)>,
>      {

Ah, the lifetime here isn't effectively bound... However, I also
referred to your latest code [1] :), and it seems that this issue
has already been fixed. (Nit: The code still has a complaint from
`cargo fmt`)

[1]: https://gitlab.com/bonzini/qemu/-/commit/ccb9f6dc738f503a696d8d50f1b5e4576ee80bc6

Regards,
Zhao


