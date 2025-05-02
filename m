Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAyxr-0004Kj-Q1
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 18:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@zabka.it>) id 1uAyxr-0004Kb-4U
 for qemu-rust@nongnu.org; Fri, 02 May 2025 18:34:39 -0400
Received: from out-181.mta1.migadu.com ([95.215.58.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@zabka.it>) id 1uAyxo-0001px-Da
 for qemu-rust@nongnu.org; Fri, 02 May 2025 18:34:38 -0400
Message-ID: <4d53c6f7-b72d-40a2-a83b-ea11e69365e6@zabka.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zabka.it; s=key1;
 t=1746225264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deLxp6ugf4UOYmbp3E6FwZWa0uI1eUwnP4Py4HK6kRo=;
 b=gGYlPilUOCvZL2g93gNbT4XfD6Sfl0iTfAjKFpLdXYwqpoilssDRkDPOLSAF3fOK+F7RS/
 +SEKGJZ+xjN7/96CLi9h2LhK2qgyT/b6Qv+9VF0/PwhqtWNcpo6DNA/f4Adj59ynpzsxre
 60TYzHicOSJRPTZzRvH2eG5YSjhteJk=
Date: Sat, 3 May 2025 00:34:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] rust: centralize config in workspace root
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250502212748.124953-1-git@zabka.it>
Content-Language: de-DE, en-GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Stefan Zabka <git@zabka.it>
In-Reply-To: <20250502212748.124953-1-git@zabka.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.181; envelope-from=git@zabka.it;
 helo=out-181.mta1.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 02 May 2025 22:34:39 -0000

Just realised that I forgot to CC Paolo and also that I didn't strictly 
enforce the tag order of name, version, authors and then alphabetically 
like I wanted to.

I hope this is still enough of an improvement over the status quo.

I also considered centralising the `publish = false` but as the hpet
crate didn't have it, I wasn't sure if I was introducing unintended 
behaviour.

I also just discovered 
[here](https://doc.rust-lang.org/cargo/reference/resolver.html#resolver-versions) 
that the resolver in the sub crates is ignored when a workspace resolver 
is set, so it would probably be more correct to just remove the entry 
entirely.

Please lmk whether that should be part of a v2 for this patch (series) 
or if I should create new separate series for that.

Best
Stefan

