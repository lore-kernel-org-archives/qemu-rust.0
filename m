Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tl80P-0005hJ-1X
	for mharc-qemu-rust@gnu.org; Thu, 20 Feb 2025 09:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1tl80N-0005gf-KT
 for qemu-rust@nongnu.org; Thu, 20 Feb 2025 09:58:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1tl80L-0004Nv-68
 for qemu-rust@nongnu.org; Thu, 20 Feb 2025 09:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740063500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OAR7SM7CRIDmgmkKisEjno8be/T1UYR8J4bbQaCfP8M=;
 b=J03TRo1R/5S+wHLEJ4aFh9D6mGMP1jveFkYvPaCKUlou/DHXE9D2CS74AKHieqQNEt2rzi
 NfWx6dvs6jb28igf4t+nT66Nrrzi1VsbZvkSg8SOgw6ZK2QRfg9XmsFTWlPtKqUIbEyr5t
 wQTKOlR2c8XeZ5SzoxgMrmoqmp97ZdQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-aBK6toz7MqG-P546AcaBmw-1; Thu,
 20 Feb 2025 09:58:16 -0500
X-MC-Unique: aBK6toz7MqG-P546AcaBmw-1
X-Mimecast-MFC-AGG-ID: aBK6toz7MqG-P546AcaBmw_1740063495
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 51E281800268; Thu, 20 Feb 2025 14:58:15 +0000 (UTC)
Received: from redhat.com (unknown [10.44.34.34])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4BC6219412A3; Thu, 20 Feb 2025 14:58:12 +0000 (UTC)
Date: Thu, 20 Feb 2025 15:58:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 manos.pitsidianakis@linaro.org, philmd@linaro.org,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: Re: [PATCH v2 04/11] rust/qemu-api: Add wrappers to run futures in
 QEMU
Message-ID: <Z7dDAdWYR82URv9c@redhat.com>
References: <20250218182019.111467-1-kwolf@redhat.com>
 <20250218182019.111467-5-kwolf@redhat.com>
 <Z7bNTILVp0KFJw57@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7bNTILVp0KFJw57@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.457,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 20 Feb 2025 14:58:23 -0000

Am 20.02.2025 um 07:35 hat Zhao Liu geschrieben:
> > +/// Use QEMU's event loops to run a Rust [`Future`] to completion and return its result.
> > +///
> > +/// This function must be called in coroutine context. If the future isn't ready yet, it yields.
> > +pub fn qemu_co_run_future<F: Future>(future: F) -> F::Output {
> > +    let waker = Waker::from(Arc::new(RunFutureWaker {
> > +        co: unsafe { bindings::qemu_coroutine_self() },
> > +    }));
> > +    let mut cx = Context::from_waker(&waker);
> > +
> > +    let mut pinned_future = std::pin::pin!(future);
> 
> pin macro stabilized in v1.68.0, but currently the minimum rustc
> supported by QEMU is v1.63.

Can we check this automatically somehow? I actually seem to remember
that I got errors for too new things before. Is the problem here that
it's a macro?

> I found there's a workaround [*], so we can add a temporary pin.rs in
> qemu_api until QEMU bumps up rustc to >= v1.68?
> 
> [*]: https://github.com/rust-lang/rust/issues/93178#issuecomment-1386177439

I don't think we'll need this anywhere else, so I can just open-code
what the macro does:

    // TODO Use std::pin::pin! when MSRV is updated to at least 1.68.0
    // SAFETY: `future` is not used any more after this and dropped at the end of the function.
    let mut pinned_future = unsafe { std::pin::Pin::new_unchecked(&mut future)};

Kevin


