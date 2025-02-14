Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiwH0-0007pF-0s
	for mharc-qemu-rust@gnu.org; Fri, 14 Feb 2025 09:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tiwGQ-0007kf-U4
 for qemu-rust@nongnu.org; Fri, 14 Feb 2025 09:02:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tiwGO-0002ND-K8
 for qemu-rust@nongnu.org; Fri, 14 Feb 2025 09:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739541711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yy+/rHWrtv+ogVlEhaYZewHUUjJp34nkmSEIMCd+tYM=;
 b=MMP1NG1h0c5PkutuXEDLTNBcvey4NxD5MZUeF3eKpj3yPQt1LIIcVTNiD+TPE6+VWs73cv
 6y4PS0xjYsG56tXiGzW5JBGVuu01Rc7zgGwhY+f045nODZHgqarHkT7THRq3AM0BWlnUAw
 YehA/C34Vju767bdooaJF+ObnrC5lIA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-uak_111aO4Op2PRz38kHng-1; Fri,
 14 Feb 2025 09:01:49 -0500
X-MC-Unique: uak_111aO4Op2PRz38kHng-1
X-Mimecast-MFC-AGG-ID: uak_111aO4Op2PRz38kHng_1739541708
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5E7CD180034A; Fri, 14 Feb 2025 14:01:48 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.144])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D69AD300018D; Fri, 14 Feb 2025 14:01:45 +0000 (UTC)
Date: Fri, 14 Feb 2025 14:01:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: Re: [PATCH] rust: tests: do not import bindings::*
Message-ID: <Z69MxsDrLUwOxtuD@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250214135822.4076174-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214135822.4076174-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.732,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 14 Feb 2025 14:02:03 -0000

On Fri, Feb 14, 2025 at 02:58:22PM +0100, Paolo Bonzini wrote:
> Similar to the devices, spell the exact set of C functions that are
> called directly.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/qemu-api/tests/tests.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
> index 92dbfb8a0c8..03569e4a44c 100644
> --- a/rust/qemu-api/tests/tests.rs
> +++ b/rust/qemu-api/tests/tests.rs
> @@ -8,13 +8,14 @@
>  };
>  
>  use qemu_api::{
> -    bindings::*,
> +    bindings::{module_call_init, module_init_type, object_new, object_unref, qdev_prop_bool},
>      c_str,
>      cell::{self, BqlCell},
>      declare_properties, define_property,
>      prelude::*,

Should this be expanded too if we want to discourage wildcard imports ?

>      qdev::{DeviceClass, DeviceImpl, DeviceState, Property, ResettablePhasesImpl},
>      qom::{ClassInitImpl, ObjectImpl, ParentField},
> +    sysbus::SysBusDevice,

This addition seems distinct from the bindings::* removal. Should it
have been a separate patch ?

>      vmstate::VMStateDescription,
>      zeroable::Zeroable,
>  };

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


